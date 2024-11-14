# lib/api_app_web/controllers/project_controller.ex

defmodule WorkboardApiWeb.ProjectController do
  use WorkboardApiWeb, :controller

  @projects [
    %{
      id: "1",
      title: "Redesign Marketing Website",
      description:
        "This project aims to enhance the design of the marketing website to improve user experience and brand alignment.",
      status: "In Progress",
      progress: 45,
      created_date: "2024-09-15",
      due_date: "2024-12-01",
      priority: "High",
      team: [
        %{name: "Alice", role: "Designer"},
        %{name: "Bob", role: "Developer"}
      ],
      milestones: [
        %{title: "Wireframe Approval", due_date: "2024-10-01", status: "Completed"},
        %{title: "Prototype Review", due_date: "2024-11-01", status: "In Progress"}
      ],
      tasks: [
        %{task_name: "Initial Wireframe", status: "Completed"},
        %{task_name: "Prototype Design", status: "In Progress"},
        %{task_name: "Final UI Implementation", status: "Pending"}
      ],
      comments: [
        %{user: "Alice", comment: "Wireframe approved by the team.", date: "2024-10-01"},
        %{user: "Bob", comment: "Working on the prototype.", date: "2024-10-15"}
      ],
      tags: ["Design", "Marketing"]
    },
    %{
      id: "2",
      title: "Develop Mobile App",
      description: "Build a mobile app for iOS and Android to increase customer engagement.",
      status: "Active",
      progress: 60,
      created_date: "2024-10-01",
      due_date: "2025-01-15",
      priority: "Medium",
      team: [
        %{name: "Charlie", role: "Frontend Developer"},
        %{name: "Diana", role: "Backend Developer"}
      ],
      milestones: [
        %{title: "UI Design Completion", due_date: "2024-10-15", status: "Completed"},
        %{title: "Backend Integration", due_date: "2024-11-30", status: "In Progress"}
      ],
      tasks: [
        %{task_name: "Prototype Build", status: "Completed"},
        %{task_name: "API Integration", status: "In Progress"}
      ],
      comments: [
        %{user: "Charlie", comment: "Design phase completed.", date: "2024-10-15"},
        %{user: "Diana", comment: "Backend development in progress.", date: "2024-11-05"}
      ],
      tags: ["Mobile", "Development"]
    },
    %{
      id: "3",
      title: "Customer Feedback Portal",
      description: "Develop a portal for customers to submit feedback and suggestions.",
      status: "On Hold",
      progress: 20,
      created_date: "2024-07-20",
      due_date: "2025-03-01",
      priority: "Low",
      team: [
        %{name: "Eve", role: "Project Manager"}
      ],
      milestones: [
        %{title: "Requirements Gathering", due_date: "2024-08-01", status: "Completed"}
      ],
      tasks: [
        %{task_name: "Define Features", status: "Completed"}
      ],
      comments: [
        %{
          user: "Eve",
          comment: "Project currently on hold due to resource constraints.",
          date: "2024-09-15"
        }
      ],
      tags: ["Feedback", "Portal"]
    },
    %{
      id: "4",
      title: "New Branding Strategy",
      description: "Create a new branding strategy including a logo redesign.",
      status: "Completed",
      progress: 100,
      created_date: "2024-01-10",
      due_date: "2024-06-30",
      priority: "High",
      team: [
        %{name: "Frank", role: "Brand Strategist"},
        %{name: "Grace", role: "Graphic Designer"}
      ],
      milestones: [
        %{title: "Logo Approval", due_date: "2024-03-15", status: "Completed"},
        %{title: "Brand Guide Creation", due_date: "2024-05-01", status: "Completed"}
      ],
      tasks: [
        %{task_name: "Research Competitors", status: "Completed"},
        %{task_name: "Logo Design", status: "Completed"}
      ],
      comments: [
        %{user: "Grace", comment: "Brand strategy finalized.", date: "2024-06-30"}
      ],
      tags: ["Branding", "Marketing"]
    },
    %{
      id: "5",
      title: "Employee Training Portal",
      description: "A platform for employees to access training resources.",
      status: "Active",
      progress: 40,
      created_date: "2024-08-20",
      due_date: "2025-02-28",
      priority: "Medium",
      team: [
        %{name: "Hank", role: "Developer"},
        %{name: "Ivy", role: "Content Creator"}
      ],
      milestones: [
        %{title: "Initial Content Upload", due_date: "2024-09-10", status: "Completed"}
      ],
      tasks: [
        %{task_name: "Content Creation", status: "In Progress"},
        %{task_name: "Portal Development", status: "In Progress"}
      ],
      comments: [
        %{user: "Ivy", comment: "Content upload started.", date: "2024-09-01"}
      ],
      tags: ["Training", "HR"]
    },
    %{
      id: "6",
      title: "AI Chatbot Integration",
      description: "Integrate AI chatbot to improve customer service efficiency.",
      status: "In Progress",
      progress: 55,
      created_date: "2024-07-15",
      due_date: "2025-01-01",
      priority: "High",
      team: [
        %{name: "Jill", role: "AI Specialist"}
      ],
      milestones: [
        %{title: "Data Collection", due_date: "2024-08-15", status: "Completed"}
      ],
      tasks: [
        %{task_name: "Build Chatbot Model", status: "In Progress"}
      ],
      comments: [
        %{user: "Jill", comment: "Data collection phase complete.", date: "2024-08-20"}
      ],
      tags: ["AI", "Customer Support"]
    },
    %{
      id: "7",
      title: "Inventory Management System",
      description: "Develop a new system to track and manage inventory.",
      status: "In Progress",
      progress: 70,
      created_date: "2024-09-01",
      due_date: "2025-03-01",
      priority: "High",
      team: [
        %{name: "Ken", role: "Developer"},
        %{name: "Lara", role: "Database Administrator"}
      ],
      milestones: [
        %{title: "Database Setup", due_date: "2024-10-01", status: "Completed"}
      ],
      tasks: [
        %{task_name: "Initial Database Configuration", status: "Completed"}
      ],
      comments: [
        %{user: "Ken", comment: "Database setup is complete.", date: "2024-10-02"}
      ],
      tags: ["Inventory", "Management"]
    },
    %{
      id: "8",
      title: "SEO Optimization",
      description: "Optimize website for search engine ranking improvement.",
      status: "Active",
      progress: 20,
      created_date: "2024-09-05",
      due_date: "2024-12-15",
      priority: "Low",
      team: [
        %{name: "Oscar", role: "SEO Specialist"}
      ],
      milestones: [
        %{title: "Keyword Analysis", due_date: "2024-09-10", status: "Completed"}
      ],
      tasks: [
        %{task_name: "On-page Optimization", status: "In Progress"}
      ],
      comments: [
        %{user: "Oscar", comment: "Keyword analysis completed.", date: "2024-09-11"}
      ],
      tags: ["SEO", "Marketing"]
    },
    %{
      id: "9",
      title: "Cybersecurity Upgrade",
      description: "Enhance cybersecurity infrastructure to prevent data breaches.",
      status: "In Progress",
      progress: 65,
      created_date: "2024-09-20",
      due_date: "2025-01-15",
      priority: "High",
      team: [
        %{name: "Pam", role: "Security Engineer"},
        %{name: "Quinn", role: "Network Engineer"}
      ],
      milestones: [
        %{title: "Infrastructure Audit", due_date: "2024-10-01", status: "Completed"}
      ],
      tasks: [
        %{task_name: "Firewall Configuration", status: "In Progress"}
      ],
      comments: [
        %{user: "Pam", comment: "Audit completed successfully.", date: "2024-10-02"}
      ],
      tags: ["Cybersecurity", "Infrastructure"]
    },
    %{
      id: "10",
      title: "Website Redesign",
      description: "Revamp the corporate website with a fresh look.",
      status: "Active",
      progress: 30,
      created_date: "2024-06-01",
      due_date: "2024-12-01",
      priority: "High",
      team: [
        %{name: "Riley", role: "Designer"},
        %{name: "Sam", role: "Frontend Developer"}
      ],
      milestones: [
        %{title: "Mockup Approval", due_date: "2024-07-01", status: "Completed"}
      ],
      tasks: [
        %{task_name: "Homepage Design", status: "In Progress"}
      ],
      comments: [
        %{user: "Riley", comment: "Mockup approved.", date: "2024-07-02"}
      ],
      tags: ["Web Design", "UI/UX"]
    }
  ]

  # Index action returns a simplified list of project data
  def index(conn, _params) do
    projects_list =
      Enum.map(@projects, fn project ->
        %{
          id: project.id,
          title: project.title,
          description:
            "A project focused on updating the marketing website with a modern design.",
          status: project.status,
          progress: project.progress,
          due_date: project.due_date,
          priority: project.priority,
          team: Enum.map(project.team, fn member -> member.name end),
          # Default tag if not provided
          tags: project[:tags] || ["General"]
        }
      end)

    json(conn, projects_list)
  end

  # Show action returns full project details
  def show(conn, %{"id" => id}) do
    project = Enum.find(@projects, fn p -> p.id == id end)

    case project do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Project not found"})

      project ->
        json(conn, project)
    end
  end
end
