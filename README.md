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
Updated: 2026-03-25T17:52:21.224186+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.937 |  |
| ap-east-1 | 0.759 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.582 |  |
| ap-northeast-2 | 0.692 |  |
| ap-northeast-3 | 0.609 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.760 |  |
| ap-southeast-3 | 0.887 |  |
| ap-southeast-4 | 0.806 |  |
| ap-southeast-5 | 0.852 |  |
| ap-southeast-6 | 0.838 |  |
| ap-southeast-7 | 0.942 |  |
| ca-central-1 | 0.104 | 16 |
| ca-west-1 | 0.234 |  |
| eu-central-1 | 0.443 |  |
| eu-central-2 | 0.456 |  |
| eu-north-1 | 0.514 |  |
| eu-south-1 | 0.471 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.373 |  |
| eu-west-2 | 0.401 |  |
| eu-west-3 | 0.422 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.816 |  |
| me-south-1 | 0.762 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.542 |  |
| us-east-1 | 0.085 | 4358 |
| us-east-2 | 0.066 | 1454 |
| us-gov-east-1 | 0.066 | 1603 |
| us-gov-west-1 | 0.267 | 190 |
| us-west-1 | 0.216 | 3295 |
| us-west-2 | 0.263 | 151 |

