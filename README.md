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
Updated: 2026-07-17T23:44:56.016676+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.662 |  |
| ap-east-2 | 0.602 |  |
| ap-northeast-1 | 0.485 |  |
| ap-northeast-2 | 0.588 |  |
| ap-northeast-3 | 0.511 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.736 |  |
| ap-southeast-2 | 0.625 |  |
| ap-southeast-3 | 0.792 |  |
| ap-southeast-4 | 0.668 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.657 |  |
| ap-southeast-7 | 0.841 |  |
| ca-central-1 | 0.240 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.550 |  |
| eu-central-2 | 0.574 |  |
| eu-north-1 | 0.607 |  |
| eu-south-1 | 0.580 |  |
| eu-south-2 | 0.587 |  |
| eu-west-1 | 0.481 |  |
| eu-west-2 | 0.514 |  |
| eu-west-3 | 0.530 |  |
| il-central-1 | 0.707 |  |
| me-central-1 | 0.914 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.213 | 4877 |
| us-east-2 | 0.204 | 1657 |
| us-gov-east-1 | 0.179 | 1765 |
| us-gov-west-1 | 0.150 | 203 |
| us-west-1 | 0.095 | 3794 |
| us-west-2 | 0.150 | 166 |

