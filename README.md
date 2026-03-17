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
Updated: 2026-03-17T10:43:01.580609+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.062 |  |
| ap-east-1 | 0.648 |  |
| ap-east-2 | 0.592 |  |
| ap-northeast-1 | 0.469 |  |
| ap-northeast-2 | 0.581 |  |
| ap-northeast-3 | 0.495 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.902 |  |
| ap-southeast-1 | 0.722 |  |
| ap-southeast-2 | 0.608 |  |
| ap-southeast-3 | 0.774 |  |
| ap-southeast-4 | 0.646 |  |
| ap-southeast-5 | 0.743 |  |
| ap-southeast-6 | 0.647 |  |
| ap-southeast-7 | 0.826 |  |
| ca-central-1 | 0.272 | 16 |
| ca-west-1 | 0.178 |  |
| eu-central-1 | 0.566 |  |
| eu-central-2 | 0.589 |  |
| eu-north-1 | 0.631 |  |
| eu-south-1 | 0.596 |  |
| eu-south-2 | 0.614 |  |
| eu-west-1 | 0.502 |  |
| eu-west-2 | 0.529 |  |
| eu-west-3 | 0.553 |  |
| il-central-1 | 0.764 |  |
| me-central-1 | 0.951 |  |
| me-south-1 | 0.913 |  |
| mx-central-1 | 0.259 |  |
| sa-east-1 | 0.678 |  |
| us-east-1 | 0.240 | 4296 |
| us-east-2 | 0.208 | 1430 |
| us-gov-east-1 | 0.206 | 1581 |
| us-gov-west-1 | 0.128 | 186 |
| us-west-1 | 0.087 | 3246 |
| us-west-2 | 0.129 | 148 |

