import { Locator, by, element, ElementFinder } from 'protractor';
import BasePage from './basePage';
import { BenefitProgram } from '../applicationObjects/benefitProgram';

export class ClassesPage extends BasePage {
  public readonly finishBtnLocator: Locator = by.css('button#action-finish');
  public readonly allBenefitTypesTitle: Locator = by.css('#classes > h2:nth-child(1)');
  private readonly productClassesCardPattern: string = `//md-card[.//b[text()='{{productLine}}']]`;
  public readonly allBenefitTypesExpandButton: Locator = by.id('class-management--accordion-arrow');
  public readonly addClassBtn: Locator = by.id(`class-management-add-class`);
  private readonly benefitProgramTable: Locator = by.css(
    '#classes > div:nth-child(3) > class-management-all-product > md-card > div.collapsable-body.ng-scope > md-content'
  );
  private readonly benefitProgramRow: Locator = by.css('class-management-all-product-row');
  private readonly benefitProgramNumber: Locator = by.id('class-management-form-number');
  private readonly classDescription: Locator = by.css(`input[id$='form-description']`);
  private readonly benefitProgramWse: Locator = by.css("*[id^='class-management-product-row-employees");

  //TO-DO : Add function in base for Element to be Present and Enabled
  public async clickFinishBtn() {
    await this.waitForElementPresenceLocator(this.finishBtnLocator);
    if (!element(this.finishBtnLocator).isEnabled) {
      await this.waitForElementPresenceLocator(this.finishBtnLocator);
    }
    await this.clickElement(this.finishBtnLocator);
  }

  private async getBenefitProgramTable(): Promise<ElementFinder> {
    return await element(this.benefitProgramTable);
  }

  public async getBenefitProgramData(): Promise<BenefitProgram[]> {
    let benefitProgramTable: ElementFinder = await this.getBenefitProgramTable();
    let benefitProgramRows: ElementFinder[] = await benefitProgramTable.all(this.benefitProgramRow);
    let benefitPrograms: BenefitProgram[] = [];

    for (let index = 0; index < benefitProgramRows.length; index++) {
      const benefitProgramRow = benefitProgramRows[index];
      let benefitProgram: BenefitProgram = new BenefitProgram();
      benefitProgram.number = parseInt(
        await benefitProgramRow.element(this.benefitProgramNumber).getAttribute('value')
      );
      benefitProgram.description = await benefitProgramRow.element(this.classDescription).getAttribute('value');
      benefitProgram.wse = parseInt(await benefitProgramRow.element(this.benefitProgramWse).getText());

      benefitPrograms.push(benefitProgram);
    }

    return benefitPrograms.sort((a, b) => {
      if (a.number > b.number) {
        return 1;
      } else if (a.number < b.number) {
        return -1;
      } else {
        return 0;
      }
    });
  }

  public async expandProductClasses(productLine: string): Promise<void> {
    const productClassesCard: Locator = by.xpath(
      this.productClassesCardPattern.replace(`{{productLine}}`, productLine)
    );
    await this.scrollElementIntoView(productClassesCard, `start`);
    const expandProductArrowLocator: Locator = by.xpath(`.//button[contains(@id, 'accordion-arrow')]`);
    const expandProductArrow: ElementFinder = await element(productClassesCard).element(expandProductArrowLocator);
    await this.clickElementFinder(expandProductArrow);
  }

  public async areProductClassesExpanded(productLine: string): Promise<boolean> {
    const productClassesCard: Locator = by.xpath(
      this.productClassesCardPattern.replace(`{{productLine}}`, productLine)
    );
    await this.scrollElementIntoView(productClassesCard, `start`);
    const expProductClassesLocator: Locator = by.xpath(`./div[contains(@class,'collapsable-body')]`);
    const expProductClasses: ElementFinder = await element(productClassesCard).element(expProductClassesLocator);
    return await this.isElementFinderVisible(expProductClasses);
  }

  public async isClassDisplayed(productLine: string, number: string, desc: string): Promise<boolean> {
    const allProductClassesLocStr: string = `//md-card[.//b[text()='{{productLine}}']]//form[@id='class-management-form']`;
    const allProductClasses: Locator = by.xpath(allProductClassesLocStr.replace(`{{productLine}}`, productLine));

    const classRows: ElementFinder[] = await element.all(allProductClasses);
    for (let classRow of classRows) {
      const classNum: ElementFinder = await classRow.element(this.benefitProgramNumber);
      const classDesc: ElementFinder = await classRow.element(this.classDescription);
      const foundClassNum: string = await classNum.getAttribute('value');
      const foundClassDesc: string = await classDesc.getAttribute('value');
      if (foundClassNum === number && foundClassDesc === desc) {
        return true;
      }
    }
    return false;
  }

  public async getClassEmpCount(classNum: string): Promise<string> {
    const classes: BenefitProgram[] = await this.getBenefitProgramData();
    return classes.find(myClass => myClass.number === Number(classNum)).wse.toString();
  }
}
