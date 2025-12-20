import PremiumLayout from "@/components/layout/PremiumLayout";

export default function PublicLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    return (
        <PremiumLayout>
            {children}
        </PremiumLayout>
    );
}
