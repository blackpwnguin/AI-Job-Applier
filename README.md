# Azure Browser Agent

This project is an automated job application agent designed to scrape job listings (e.g., from LinkedIn), filter them based on user-defined criteria, and apply to them automatically. It leverages **Azure Functions** for orchestration, **Playwright** for browser automation, and **Ollama** for local AI-powered resume tailoring and decision making.

## 🚀 Features

- **Automated Scraping**: Uses Playwright to navigate job boards.
- **Smart Filtering**: Filters jobs based on a Blacklist (e.g., "Sales", "Marketing") and Whitelist (e.g., "Cyber", "AI", "Engineer").
- **AI Integration**: Uses **Ollama** locally to analyze job descriptions and potentially tailor resumes.
- **Resume Management**: Handles PDF (`resume.pdf`) and generates tailored Docx resumes.
- **Application Tracking**: Keeps a record of applied jobs in `applied_jobs.json` to prevent duplicate applications.
- **Local Development Orchestration**: Includes a `start_bot.sh` script to manage Ollama, Azurite, and the Azure Function app simultaneously.

## 🛠️ Prerequisites

Ensure you have the following installed:

- **Python 3.x**
- **Azure Functions Core Tools** (`brew install azure-functions-core-tools`)
- **Node.js & Azurite** (or install via VS Code extension) (`npm install -g azurite`)
- **Ollama** (for local LLM support)
- **Git**

## 📦 Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/blackpwnguin/AI-Job-Applier.git
    cd AI-Job-Applier
    ```

2.  **Create and activate a virtual environment:**
    ```bash
    python -m venv .venv
    source .venv/bin/activate  # On Windows: .venv\Scripts\activate
    ```

3.  **Install Python dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

4.  **Install Playwright browsers:**
    ```bash
    playwright install
    ```

5.  **Set up Environment Variables:**
    Create a `.env` file in the root directory (or use `local.settings.json` for Functions) and add necessary variables (e.g., LinkedIn credentials if required).

6.  **Prepare your Resume:**
    Place your base resume named `resume.pdf` in the root directory.

## 🏃‍♂️ Usage

The project includes a helper script `start_bot.sh` that spins up all necessary local services.

1.  **Make the script executable (only needed once):**
    ```bash
    chmod +x start_bot.sh
    ```

2.  **Run the bot:**
    ```bash
    ./start_bot.sh
    ```

This script will:
- Check and start `ollama serve` if not running.
- Start `azurite` (Azure Storage Emulator).
- Start the Azure Functions host (`func start`).

## 📁 Project Structure

- `function_app.py`: Main Azure Function code containing the scraping logic, filtering, and Ollama integration.
- `start_bot.sh`: Bash script to orchestrate local development services.
- `requirements.txt`: Python package dependencies.
- `resume.pdf`: Your source resume file.
- `tailored_resumes/`: Directory where AI-tailored resumes are saved.
- `applied_jobs.json`: Log of jobs that have been applied to.

## ⚙️ Configuration

You can customize the filtering logic in `function_app.py`:

```python
BLACKLIST = ["Sales", "Account Executive", "Recruiter", ...]
WHITELIST = ["Cyber", "Security", "AI", "Engineer", ...]
```

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## 📄 License

[MIT](https://choosealicense.com/licenses/mit/)
