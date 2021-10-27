const monthNames = [
  '0 month index',
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

export default {
  /**
   * Our app has particular style of displaying effective dates. This will reformat strings
   * @param yyyymmdd
   */
  getEffectiveDateString(yyyymmdd: string) {
    let splitDate: string[] = yyyymmdd.split('-');
    return (
      monthNames[splitDate[1].replace(/^(?!00[^0])0/, '')] +
      ' ' +
      splitDate[2].substring(0, 2).replace(/^(?!00[^0])0/, '') +
      ', ' +
      splitDate[0]
    );
  },

  getNextQuoteEffectiveDate(): string {
    const options = { month: 'long', day: 'numeric', year: 'numeric' };
    return this.getNextQuoteEffectiveDateFormatted(options);
  },

  getNextQuoteEffectiveDateFormatted(options: Object): string {
    const now = new Date();
    if (now.getDate() === 1) {
      return now.toLocaleDateString('en-US', options);
    } else if (now.getMonth() === 11) {
      return new Date(now.getFullYear() + 1, 0, 1).toLocaleDateString('en-US', options);
    } else {
      return new Date(now.getFullYear(), now.getMonth() + 1, 1).toLocaleDateString('en-US', options);
    }
  },

  isArraySorted(dates: Date[]): Boolean {
    if (dates === undefined) {
      return false;
    } else if (dates.length == 0) {
      return true;
    }
    for (let i = 0; i < dates.length - 1; i++) {
      if (dates[i] > dates[i + 1]) {
        return false;
      }
    }
    return true;
  }
};
