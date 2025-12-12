import PlaceholderPage from "@/components/placeholder-page";

export default async function StudentCatchAllPage({ params }: { params: Promise<{ slug: string[] }> }) {
    const { slug } = await params;
    const sectionName = slug.map(s => s.charAt(0).toUpperCase() + s.slice(1)).join(' ');

    return (
        <PlaceholderPage
            title={sectionName}
            backLink="/student/dashboard"
            backText="Back to Dashboard"
        />
    );
}
