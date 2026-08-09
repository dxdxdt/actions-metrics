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
Updated: 2026-08-09T18:27:58.397074+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.692 |  |
| ap-northeast-3 | 0.609 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.894 |  |
| ap-southeast-1 | 0.837 |  |
| ap-southeast-2 | 0.736 |  |
| ap-southeast-3 | 0.894 |  |
| ap-southeast-4 | 0.780 |  |
| ap-southeast-5 | 0.855 |  |
| ap-southeast-6 | 0.766 |  |
| ap-southeast-7 | 0.942 |  |
| ca-central-1 | 0.170 | 18 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.461 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.469 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.358 |  |
| eu-west-2 | 0.398 |  |
| eu-west-3 | 0.425 |  |
| il-central-1 | 0.606 |  |
| me-central-1 | 0.839 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.547 |  |
| us-east-1 | 0.114 | 4964 |
| us-east-2 | 0.131 | 1677 |
| us-gov-east-1 | 0.133 | 1812 |
| us-gov-west-1 | 0.261 | 214 |
| us-west-1 | 0.208 | 3914 |
| us-west-2 | 0.260 | 175 |

