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
Updated: 2026-04-19T01:56:45.248455+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.659 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.647 |  |
| ap-northeast-3 | 0.566 |  |
| ap-south-1 | 0.941 |  |
| ap-south-2 | 0.957 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.856 |  |
| ap-southeast-4 | 0.744 |  |
| ap-southeast-5 | 0.823 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.893 |  |
| ca-central-1 | 0.165 | 16 |
| ca-west-1 | 0.236 |  |
| eu-central-1 | 0.484 |  |
| eu-central-2 | 0.508 |  |
| eu-north-1 | 0.542 |  |
| eu-south-1 | 0.508 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.414 |  |
| eu-west-2 | 0.445 |  |
| eu-west-3 | 0.471 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.857 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.192 |  |
| sa-east-1 | 0.582 |  |
| us-east-1 | 0.138 | 4524 |
| us-east-2 | 0.113 | 1513 |
| us-gov-east-1 | 0.107 | 1656 |
| us-gov-west-1 | 0.217 | 194 |
| us-west-1 | 0.162 | 3437 |
| us-west-2 | 0.221 | 156 |

