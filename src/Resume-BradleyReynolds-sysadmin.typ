#import "@preview/simple-technical-resume:0.1.1": *

#let name = "Bradley Reynolds"
#let phone = "+1 (940) 273-2838"
#let email = "bradley.reynolds@tailstory.dev"
#let github = "shenanigansd"
#let linkedin = "bradleytreynolds"
// LaTeX version doesn’t include a site, but your earlier template did.
// Keep it if you want; remove if not.
#let personal-site = "https://shenanigans.dog/"

#show: resume.with(
  top-margin: 0.45in,
  personal-info-font-size: 9.2pt,
  author-position: center,
  personal-info-position: center,
  author-name: name,
  phone: phone,
  email: email,
  website: personal-site,
  linkedin-user-id: linkedin,
  github-username: github
)

#custom-title("Technologies")[
  #skills()[
    - *Microsoft:* Entra ID (née Azure AD), Intune, Defender, Sentinel
  ]
]

#custom-title("Work Experience")[
  #work-heading(
    "IT Administrator",
    "Impress Designs",
    "Texas, United States",
    datetime(year: 2018, month: 12, day: 1),
    "Present"
  )[
    - Adopted cloud-native approach shifting PCs from local accounts and Active Directory join to Entra native join, reducing identity tickets by 30%
    - Migrated on-premises file servers to SharePoint Online, enabling significantly deeper integration with Microsoft cloud services
    - Implemented Windows Update for Business (WUfB) and Autopatch, resulting in a 200% increase in patch compliance
    - Implemented Defender for Endpoint and Azure Sentinel for security monitoring and incident response, reducing detection-to-response time from “when someone notices” to minutes
    - Represented Impress Designs in a collaboration effort with a Fortune 500 company and the world’s richest sports team to develop a custom ERP integrating, handling, and tracking orders across client systems
  ]
]

#custom-title("Education")[
  #education-heading(
    "High School",
    "", // Location not specified in LaTeX
    "High School Diploma",
    "",
    datetime(year: 2014, month: 8, day: 1),
    datetime(year: 2018, month: 6, day: 1),
  )[
    - AJROTC Distinguished Cadet
    - Order of Daedalians JROTC Achievement Award
  ]
]
