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
Updated: 2026-03-14T23:21:02.766981+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.020 |  |
| ap-east-1 | 0.684 |  |
| ap-east-2 | 0.629 |  |
| ap-northeast-1 | 0.508 |  |
| ap-northeast-2 | 0.609 |  |
| ap-northeast-3 | 0.533 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.955 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.666 |  |
| ap-southeast-3 | 0.814 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.778 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.861 |  |
| ca-central-1 | 0.224 | 16 |
| ca-west-1 | 0.246 |  |
| eu-central-1 | 0.529 |  |
| eu-central-2 | 0.544 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.553 |  |
| eu-south-2 | 0.551 |  |
| eu-west-1 | 0.445 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.503 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.898 |  |
| me-south-1 | 0.858 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.173 | 4279 |
| us-east-2 | 0.142 | 1423 |
| us-gov-east-1 | 0.144 | 1576 |
| us-gov-west-1 | 0.164 | 185 |
| us-west-1 | 0.163 | 3233 |
| us-west-2 | 0.161 | 146 |

