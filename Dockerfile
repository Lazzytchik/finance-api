FROM golang:alpine AS builder

WORKDIR /app

# install git
RUN apk update
RUN apk add git
RUN apk add openssh
RUN apk add go

RUN apk update



# add credentials on build
ARG SSH_PRIVATE_KEY
RUN mkdir /root/.ssh/
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_ed25519
RUN chmod 600 /root/.ssh/id_ed25519

RUN echo "${SSH_PRIVATE_KEY}"

# make sure your domain is accepted
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

ARG GIT_TOKEN
ADD "https://${GIT_TOKEN}@api.github.com/repos/Lazzytchik/finance-bot/commits?per_page=1" latest_commit
RUN git clone git@github.com:Lazzytchik/finance-bot.git repo

WORKDIR /app/repo

RUN go build -o binary cmd/main.go

FROM alpine

RUN apk add chromium

#RUN cp -r /usr/lib/chromium /usr/bin/chromium

COPY --from=builder /app/repo/binary /binary

WORKDIR /

CMD ["./binary"]