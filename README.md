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
Updated: 2026-08-04T10:29:06.383160+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.988 |  |
| ap-east-1 | 0.695 |  |
| ap-east-2 | 0.635 |  |
| ap-northeast-1 | 0.519 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.543 |  |
| ap-south-1 | 0.886 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.664 |  |
| ap-southeast-3 | 0.825 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.789 |  |
| ap-southeast-6 | 0.727 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.234 | 17 |
| ca-west-1 | 0.219 |  |
| eu-central-1 | 0.512 |  |
| eu-central-2 | 0.543 |  |
| eu-north-1 | 0.555 |  |
| eu-south-1 | 0.539 |  |
| eu-south-2 | 0.548 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.469 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.922 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.185 | 4938 |
| us-east-2 | 0.194 | 1673 |
| us-gov-east-1 | 0.195 | 1800 |
| us-gov-west-1 | 0.189 | 210 |
| us-west-1 | 0.130 | 3882 |
| us-west-2 | 0.192 | 172 |

