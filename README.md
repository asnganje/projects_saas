<a name="readme-top"></a>


# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [SaaS-App ](#saas-app-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# SaaS-App <a name="about-project"></a>

**SaaS-app** A Software as a Service application built with Ruby on Rails and Hotwire (Turbo + Stimulus), supporting multitenancy via subdomains with tenant-specific data isolation. It features user authentication (Devise), real-time UI updates using Turbo Streams, and a clean, responsive design with Tailwind CSS. Designed for scalability and modularity.


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

> Developed using Ruby on Rails.
<details>
  <summary>Languages</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
  </ul>
  <ul>
    <li><a href="https://rubyonrails.org/">Rails</a></li>
  </ul>
  <ul>
    <li><a href="https://rubyonrails.org/">Tailwind CSS</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>
- **Subdomain-based Multitenancy – Isolates tenant data using unique subdomains**
- **User Authentication – Secure login and registration per tenant using Devise.**
- **Tenant-scoped Authorization – Ensures users can only access their own organization’s data.**
- **Real-time Updates – Turbo Streams keep pages updated live without full reloads (e.g., live chat, notifications).**
- **Responsive UI – Built with Tailwind CSS and Turbo Frames for a snappy, modern interface.**
- **Admin Dashboard – Optional global admin interface to manage tenants, users, and usage.**
- **Stripe Integration – Subscription billing per tenant**

## 💻 Getting Started <a name="getting-started"></a>
> To get a local copy up and running, follow these steps.
- install gems bundle i
- setup database rails db:setup 
- run rails server OR rails s.

### Prerequisites

In order to run this project you need:

- Install Ruby
- Install PostgreSQL
- Instal Rails gem

### Setup
```
- To clone the repository run this command:

 `git clone https://github.com/asnganje/projects_saas.git`



- To access the cloned directory run:

  `cd projects_saas`

```
## 👥 Authors <a name="authors"></a>

👤 **Abdulrahman Nganje**
- GitHub: [@Nganje](https://github.com/asnganje)
- Twitter: [@asnganje](https://twitter.com/asnganje)
- LinkedIn: [@Nganje](https://www.linkedin.com/in/abdulrahman-nganje-a6436935/)

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[Working on them]**

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).


## ⭐️ Show your support <a name="support"></a>

Give a ⭐️ if you like this project!


## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank to thank my family and coding mentors for their support.

## 📝 License <a name="license"></a>

This project is [MIT](https://choosealicense.com/licenses/mit/) licensed. 

<p align="right">(<a href="#readme-top">back to top</a>)</p>
