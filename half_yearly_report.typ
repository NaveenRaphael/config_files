#set text(font: "Times New Roman")
#show heading.where(level:1): t=>[
  #set align(center)
  #text(font: "Times New Roman",size: 18pt, t.body)
]

#set align(center)
= Half-Yearly Progress Report for xxx-xxx 202x
== Data Sheet for PhD Scholars
#set align(left)
#[
#show table.cell.where(x:0) : strong
  
#table(columns: (1fr, 1fr),
[Name],             [xxx],
[Registration No.], [xxx],
[Department], [Mechanical Engineering],
[Date of Joining], [11/07/2022],
[Specialization/Stream], [Design],
[Area of Research Work], [xxx ],
[Category of Admission], [Regular],
[Guide], [xxx],
)
]

== Date of DC Meetings

#table(
  columns: (1fr, 2fr, 1fr),
  [*Description*], [*Event*], [*Date*],
  [$0^"th"$ DC Meeting], [Prescription of coursework], [-],
  [$1^"st"$ DC Meeting], [Comprehensive Viva (as per ordinance)], [-],
  [$2^"nd"$ DC Meeting], [Progress Review/Research Proposal Seminar (within 30 months from the date of registration) (Mandatory)], [-],
  [$3^"rd"$ DC Meeting], [Progress Review/ Research Colloquium (within 24 months from the date of Research Proposal Seminal) (Mandatory)], [-],
  [Thesis submission meeting], [Within 6 months from the date of the Colloquium (Mandatory)], [-],
  [Six Monthly DC Meeting], [After 5 years from the date of registration], [-],
)
#pagebreak(weak:true) 

== Details of Coursework
#table(
  columns: (auto, 1fr, 2fr, 1fr, 1fr, 1fr),
  [*S.no*], [*Course No*], [*Course Title*], [*Semester*], [*Credits*], [*Grade*],
  [1], [xxx], [xxx], [1], [x], [x],
  [2], [xxx], [xxx], [1], [x], [x],
  [3], [xxx], [xxx], [1], [x], [x],
  [4], [xxx], [xxx], [1], [x], [x],
  [5], [xxx], [xxx], [1], [x], [x]
)

#table(columns: (1fr, 1fr),
[Signature of Scholar], [Signature of Guide], [])

#pagebreak()
#[
  #set text(size: 20pt)
  TITLE
]
#show heading.where(level:2): it=>{ 
  set text(size: 16pt, font:"New Computer Modern Sans"); 
  it
}

== Problem Definition

== Brief Literature Review

== Summary of Work Done up to Previous Review

== Work Done in this review period

== Future Work

== References
// #bibliography("Nov_6_24.bib",title: none)
