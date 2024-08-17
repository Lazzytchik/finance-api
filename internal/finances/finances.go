package finances

import "context"

type Service interface {
	Spend(ctx context.Context, params SpendParams) error
	Income(ctx context.Context, params IncomeParams) error
	MonthStat(ctx context.Context, params StatParams) (CredAndDebStat, error)
}
