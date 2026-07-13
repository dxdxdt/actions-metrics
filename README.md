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
Updated: 2026-07-13T22:48:18.416069+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.928 |  |
| ap-east-1 | 0.746 |  |
| ap-east-2 | 0.688 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.673 |  |
| ap-northeast-3 | 0.595 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.955 |  |
| ap-southeast-1 | 0.819 |  |
| ap-southeast-2 | 0.741 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.787 |  |
| ap-southeast-5 | 0.838 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.925 |  |
| ca-central-1 | 0.170 | 16 |
| ca-west-1 | 0.279 |  |
| eu-central-1 | 0.442 |  |
| eu-central-2 | 0.461 |  |
| eu-north-1 | 0.496 |  |
| eu-south-1 | 0.475 |  |
| eu-south-2 | 0.482 |  |
| eu-west-1 | 0.354 |  |
| eu-west-2 | 0.402 |  |
| eu-west-3 | 0.426 |  |
| il-central-1 | 0.597 |  |
| me-central-1 | 0.841 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.558 |  |
| us-east-1 | 0.113 | 4868 |
| us-east-2 | 0.130 | 1656 |
| us-gov-east-1 | 0.125 | 1743 |
| us-gov-west-1 | 0.252 | 202 |
| us-west-1 | 0.205 | 3774 |
| us-west-2 | 0.253 | 165 |

