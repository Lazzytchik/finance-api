package finances

import (
	"time"

	"github.com/lazzytchik/finance-api/internal/model"
)

type IncomeParams struct {
	CatagoryId int
	Name       string
	Sum        float64
	Date       time.Time
	Author     string
}

type SpendParams struct {
	CatagoryId int
	Name       string
	Sum        float64
	Date       time.Time
	Author     string
}

type StatParams struct {
	Year  model.Year
	Month time.Month
}

type MonthlyStat struct {
	CategoryID   int         `db:"category_id"`
	CategoryName string      `db:"category_name"`
	Sum          model.Money `db:"spent"`
	Differ       model.Money `db:"differ"`
}

type Balance struct {
	Income  model.Money
	Spent   model.Money
	Balance model.Money
}

type CredAndDebStat struct {
	MonthlyStat []MonthlyStat
	TotalDiff   model.Money

	Balance Balance
}
