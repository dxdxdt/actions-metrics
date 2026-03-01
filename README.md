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
Updated: 2026-03-01T08:22:34.574309+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.965 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.669 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.659 |  |
| ap-northeast-3 | 0.572 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.947 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.712 |  |
| ap-southeast-3 | 0.861 |  |
| ap-southeast-4 | 0.746 |  |
| ap-southeast-5 | 0.826 |  |
| ap-southeast-6 | 0.768 |  |
| ap-southeast-7 | 0.907 |  |
| ca-central-1 | 0.148 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.471 |  |
| eu-central-2 | 0.481 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.493 |  |
| eu-south-2 | 0.502 |  |
| eu-west-1 | 0.398 |  |
| eu-west-2 | 0.423 |  |
| eu-west-3 | 0.449 |  |
| il-central-1 | 0.634 |  |
| me-central-1 | 0.837 |  |
| me-south-1 | 0.800 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.569 |  |
| us-east-1 | 0.122 | 4202 |
| us-east-2 | 0.115 | 1387 |
| us-gov-east-1 | 0.135 | 1519 |
| us-gov-west-1 | 0.211 | 166 |
| us-west-1 | 0.200 | 3146 |
| us-west-2 | 0.209 | 135 |

