import PlaceholderPage from "@/components/placeholder-page";

interface HODSlugPageProps {
    params: Promise<{ slug: string[] }>;
}

export default async function HODSlugPage({ params }: HODSlugPageProps) {
    const { slug } = await params;
    const title = slug
        .map((s) => s.charAt(0).toUpperCase() + s.slice(1).replace(/-/g, " "))
        .join(" - ");

    return (
        <PlaceholderPage
            title={title}
            description="This HOD module is currently under development. Please check back soon for full functionality."
            backLink="/hod/dashboard"
            backText="Back to Dashboard"
        />
    );
}
