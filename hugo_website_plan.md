# Hugo Website Plan for Petra

This plan outlines the steps to create a static Hugo website for Petra, a local musician from Bempflingen specializing in wedding, funeral, and event performances. The website will be in German and feature a modern, light, and conservative design using the "Ananke" theme.

**Plan:**

1.  **Install Hugo:** If you don't have Hugo installed, follow the official installation guide for your operating system: [https://gohugo.io/getting-started/installing/](https://gohugo.io/getting-started/installing/)
2.  **Create a new Hugo site:** Open your terminal or command prompt, navigate to the directory where you want to create the site (in this case, `/Users/robin/Documents/robin/petra`), and run the following command:
    ```bash
    hugo new site . --force
    ```
    The `--force` flag is used because the directory is not empty from Hugo's perspective (due to potential hidden files or system configurations), but it will create the new site structure within the current directory.
3.  **Add the "Ananke" Theme:** Add the "Ananke" theme to your site. Navigate to your site's root directory in the terminal and run:
    ```bash
    git init
    git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
    ```
4.  **Configure the site:** Edit the `config.toml` (or `config.yaml`/`config.json`) file in the root of your site to configure the site title, language, theme, and other settings.
    *   Set the language to German: `languageCode = "de-de"`
    *   Specify the theme: `theme = "ananke"`
    *   Add other necessary configurations as per the Ananke theme documentation.
5.  **Create Content Pages:**
    *   **Landing Page:** Create an `_index.md` file in the `content` directory for the landing page. This will be the main page of your site.
    *   **Imprint Page:** Create a new page for the imprint. Run `hugo new imprint.md` and add the necessary legal information to the generated file.
    *   **Contact Form Page:** Create a new page for the contact form. Run `hugo new contact.md`. Implementing a functional contact form requires a third-party service (like Formspree, Netlify Forms, etc.) or a mailto link. You will need to integrate the form code provided by your chosen service into this page's template or content.
    *   **Image Gallery Page:** Create a new page for the image gallery. Run `hugo new gallery.md`. Add the image of Petra and any other images here. To initially disable the gallery, you can set `draft: true` in the front matter of `gallery.md` or remove it from the site's menu configuration.
6.  **Integrate Petra's Image:** Place the image file (e.g., `petra.jpg`) in the `static` directory of your Hugo site. You can then reference this image in your content files (e.g., on the landing page) using a path like `/petra.jpg`.
7.  **Customize Theme (Optional but Recommended):** Customize the "Ananke" theme through its configuration options or by overriding default layouts to fully achieve the desired modern, light, and conservative design and integrate the image seamlessly. Refer to the Ananke theme documentation for customization details.

**Mermaid Diagram of Site Structure:**

```mermaid
graph TD
    A[Hugo Site Root] --> B(config.toml)
    A --> C(content)
    A --> D(static)
    A --> E(themes)
    C --> F(_index.md - Landing Page)
    C --> G(imprint.md - Imprint Page)
    C --> H(contact.md - Contact Page)
    C --> I(gallery.md - Image Gallery)
    D --> J(petra.jpg - Petra's Image)
    E --> K(ananke - Ananke Theme)