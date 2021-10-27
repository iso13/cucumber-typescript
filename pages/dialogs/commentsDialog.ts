import BaseDialog from './baseDialog';
import { Locator, by, element, ElementFinder } from 'protractor';

export class CommentsDialog extends BaseDialog {
  public readonly commentLocator: Locator = by.xpath('//md-list-item[@class="md-3-line md-no-proxy ng-scope _md"]');
  public readonly commentTitleLocator: string = '//md-list-item[{index}]//p[@class="comment-body ng-binding"]';
  public readonly commentProductLinesLocator: string =
    '//md-list-item[{index}]//p[@ng-if="comment.subject.product_lines"]';
  public readonly commentReasonCodesLocator: string =
    '//md-list-item[{index}]//p[@ng-if="comment.subject.comment_codes"]';
  public readonly addNewCommentTextBox: Locator = by.id('chat-input');
  public readonly addCommentBtn: Locator = by.css('button[query="vm.commentQuery"]');

  public async getNumberOfComments(): Promise<number> {
    const commentElements: Array<ElementFinder> = await this.getElements(this.commentLocator);
    return commentElements.length;
  }

  public async getCommentTitle(commentIndex: number): Promise<string> {
    const commentTitleLocator = by.xpath(this.commentTitleLocator.replace('{index}', commentIndex.toString()));
    return await element(commentTitleLocator).getText();
  }

  public async getCommentDeclinedProductLines(commentIndex: number): Promise<string | undefined> {
    const commentDeclineProductLinesLocator = by.xpath(
      this.commentProductLinesLocator.replace('{index}', commentIndex.toString())
    );
    return (await element(commentDeclineProductLinesLocator).isPresent())
      ? await element(commentDeclineProductLinesLocator).getText()
      : undefined;
  }

  public async getCommentReasonCode(commentIndex: number): Promise<string | undefined> {
    const commentReasonCodeLocator = by.xpath(
      this.commentReasonCodesLocator.replace('{index}', commentIndex.toString())
    );
    return (await element(commentReasonCodeLocator).isPresent())
      ? await element(commentReasonCodeLocator).getText()
      : undefined;
  }

  public async getCommentData(commentIndex: number): Promise<ICommentsData> {
    const commentTitle = await this.getCommentTitle(commentIndex);
    const commentProductLines = await this.getCommentDeclinedProductLines(commentIndex);
    const commentResonCodes = await this.getCommentReasonCode(commentIndex);
    return {
      title: commentTitle,
      declinedProductLines: commentProductLines,
      reasonCode: commentResonCodes
    };
  }

  public async getAllCommentsData(): Promise<Array<ICommentsData>> {
    const commentsData: Array<ICommentsData> = new Array();
    const numberOfComments: number = await this.getNumberOfComments();
    for (let commentIndex = 1; commentIndex <= numberOfComments; commentIndex++) {
      const commentData: ICommentsData = await this.getCommentData(commentIndex);
      commentsData.push(commentData);
    }
    return commentsData;
  }
}

export interface ICommentsData {
  title: string;
  declinedProductLines?: string;
  reasonCode?: string;
}
