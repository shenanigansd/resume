#import "@preview/simple-technical-resume:0.1.1": *

#let name = "Bradley Reynolds"
#let phone = "+1 (940) 273-2838"
#let email = "bradley.reynolds@tailstory.dev"
#let github = "shenanigansd"
#let linkedin = "bradleytreynolds"
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
    - *Programming Languages:* Python
    - *Libraries:* Flask, FastAPI, pytest, pandas
    - *Tools:* Docker, Kubernetes, Sentry, GitHub Actions
  ]
]

#custom-title("Experience")[
  #work-heading(
    "IT Administrator & Software Engineer",
    "Impress Designs",
    "Texas, United States",
    datetime(year: 2018, month: 12, day: 1),
    "Present"
  )[
    - Developed custom ERP integrations for task/management tracking
    - Improved operational efficiency by 32%
    - Developed custom API integrations for order processing, virtually eliminating manual adjustments
  ]

  #work-heading(
    "DevOps / Infrastructure Maintainer (Volunteer)",
    "Python Discord",
    "Remote",
    datetime(year: 2020, month: 1, day: 1),
    "Present"
  )[
    - Maintain organization applications and infrastructure as part of DevOps responsibilities
    - Help plan, organize, and execute community events
  ]
]

#custom-title("Projects")[
  #project-heading(
    "Vipyr Security",
  )[
    - Developed automated security scanning software for Python packages uploaded to PyPI
    - Successfully reported over 650 malicious packages as one of the fastest and most consistent reporters according to the Python Software Foundation's Director of Infrastructure
  ]

  #project-heading(
    "Ukraine Relief Efforts",
  )[
    - Collected border crossing information for countries surrounding Ukraine and presented it in multiple languages on a single website, including notices about available transportation and delays
    - Centralized incoming missile alerts, giving civilians more time to get to safety
    - Broadcasted civilian safety alerts to Twitter in multiple languages, helping raise visibility
    - Created a website to help promote fundraisers and streamline donations
    - Coordinated with the International Commission on Missing Persons to help streamline collecting information on missing persons
  ]
]

#custom-title("Accolades")[
  #skills()[
    - JROTC, Distinguished and Achievement Awards
    - EUOSO commendation for international support efforts
  ]
]
