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
Updated: 2026-02-16T21:22:06.754832+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.632 |  |
| ap-south-1 | 0.946 |  |
| ap-south-2 | 0.962 |  |
| ap-southeast-1 | 0.779 |  |
| ap-southeast-2 | 0.685 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.726 |  |
| ap-southeast-5 | 0.796 |  |
| ap-southeast-6 | 0.790 |  |
| ap-southeast-7 | 0.880 |  |
| ca-central-1 | 0.185 | 16 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.492 |  |
| eu-central-2 | 0.529 |  |
| eu-north-1 | 0.554 |  |
| eu-south-1 | 0.524 |  |
| eu-south-2 | 0.534 |  |
| eu-west-1 | 0.422 |  |
| eu-west-2 | 0.468 |  |
| eu-west-3 | 0.487 |  |
| il-central-1 | 0.690 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.837 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.154 | 4132 |
| us-east-2 | 0.152 | 1348 |
| us-gov-east-1 | 0.132 | 1481 |
| us-gov-west-1 | 0.177 | 150 |
| us-west-1 | 0.185 | 3066 |
| us-west-2 | 0.179 | 126 |

