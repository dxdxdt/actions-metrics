# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-02-12T23:22:09.845204+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.904 |  |
| ap-east-1 | 0.802 |  |
| ap-northeast-1 | 0.624 |  |
| ap-northeast-2 | 0.731 |  |
| ap-south-1 | 0.853 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.881 |  |
| ap-southeast-2 | 0.784 |  |
| ap-southeast-3 | 0.938 |  |
| ap-southeast-4 | 0.823 |  |
| ca-central-1 | 0.105 | 16 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.425 |  |
| eu-north-1 | 0.453 |  |
| eu-south-1 | 0.435 |  |
| eu-south-2 | 0.445 |  |
| eu-west-1 | 0.335 |  |
| eu-west-2 | 0.365 |  |
| eu-west-3 | 0.395 |  |
| il-central-1 | 0.577 |  |
| me-central-1 | 0.990 |  |
| me-south-1 | 0.899 |  |
| sa-east-1 | 0.504 |  |
| us-east-1 | 0.069 | 4113 |
| us-east-2 | 0.085 | 1334 |
| us-gov-east-1 | 0.086 | 1456 |
| us-gov-west-1 | 0.276 | 145 |
| us-west-1 | 0.250 | 3049 |
| us-west-2 | 0.279 | 125 |

