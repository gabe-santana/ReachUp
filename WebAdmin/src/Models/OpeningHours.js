class OpeningHours {
    WeekDay;
    OpeningTime;
    ClosingTime;

    constructor(weekDay = 0, openingTime = '', closingTime = ''){
        this.WeekDay = weekDay;
        this.OpeningTime = openingTime;
        this.ClosingTime = closingTime;
    }
}