import { toast as shadcnToast } from "@/components/ui/use-toast"

export const toast = Object.assign(
    (props: any) => shadcnToast(props),
    {
        success: (message: string) => shadcnToast({ title: "Success", description: message }),
        error: (message: string) => shadcnToast({ variant: "destructive", title: "Error", description: message }),
    }
)

