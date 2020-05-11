package com.yi.domain;

public class ExamVO {
	private TestVO tNo;
	private SubjectVO sNo;
	private int eNo;
	private String eName;
	private int eDescription;
	private String eContent;
	private String eContent2;
	private String eContent3;
	private String eContent4;
	private int eAnswer;
	private String eSolving;
	private int eAnswerRate;

	public ExamVO() {
	}

	public ExamVO(TestVO tNo, SubjectVO sNo, int eNo) {
		this.tNo = tNo;
		this.sNo = sNo;
		this.eNo = eNo;
	}

	public ExamVO(TestVO tNo, SubjectVO sNo, int eNo, String eName, int eDescription, String eContent,
			String eContent2, String eContent3, String eContent4, int eAnswer, String eSolving, int eAnswerRate) {
		super();
		this.tNo = tNo;
		this.sNo = sNo;
		this.eNo = eNo;
		this.eName = eName;
		this.eDescription = eDescription;
		this.eContent = eContent;
		this.eContent2 = eContent2;
		this.eContent3 = eContent3;
		this.eContent4 = eContent4;
		this.eAnswer = eAnswer;
		this.eSolving = eSolving;
		this.eAnswerRate = eAnswerRate;
	}

	public TestVO gettNo() {
		return tNo;
	}

	public void settNo(TestVO tNo) {
		this.tNo = tNo;
	}

	public SubjectVO getsNo() {
		return sNo;
	}

	public void setsNo(SubjectVO sNo) {
		this.sNo = sNo;
	}

	public int geteNo() {
		return eNo;
	}

	public void seteNo(int eNo) {
		this.eNo = eNo;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public int geteDescription() {
		return eDescription;
	}

	public void seteDescription(int eDescription) {
		this.eDescription = eDescription;
	}

	public String geteContent() {
		return eContent;
	}

	public void seteContent(String eContent) {
		this.eContent = eContent;
	}

	public String geteContent2() {
		return eContent2;
	}

	public void seteContent2(String eContent2) {
		this.eContent2 = eContent2;
	}

	public String geteContent3() {
		return eContent3;
	}

	public void seteContent3(String eContent3) {
		this.eContent3 = eContent3;
	}

	public String geteContent4() {
		return eContent4;
	}

	public void seteContent4(String eContent4) {
		this.eContent4 = eContent4;
	}

	public int geteAnswer() {
		return eAnswer;
	}

	public void seteAnswer(int eAnswer) {
		this.eAnswer = eAnswer;
	}

	public String geteSolving() {
		return eSolving;
	}

	public void seteSolving(String eSolving) {
		this.eSolving = eSolving;
	}

	public int geteAnswerRate() {
		return eAnswerRate;
	}

	public void seteAnswerRate(int eAnswerRate) {
		this.eAnswerRate = eAnswerRate;
	}

	@Override
	public String toString() {
		return "ExamVO [tNo=" + tNo + ", sNo=" + sNo + ", eNo=" + eNo + ", eName=" + eName + ", eDescription="
				+ eDescription + ", eContent=" + eContent + ", eContent2=" + eContent2 + ", eContent3=" + eContent3
				+ ", eContent4=" + eContent4 + ", eAnswer=" + eAnswer + ", eSolving=" + eSolving + ", eAnswerRate="
				+ eAnswerRate + "]";
	}

}
