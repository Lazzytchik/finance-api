package finances

type Repository interface {
	AddIncome()
	AddSpend()
	MonthlyBalance()
	MonthSpendStat()
}
