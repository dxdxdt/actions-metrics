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
Updated: 2026-07-19T20:04:35.533810+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.028 |  |
| ap-east-1 | 0.666 |  |
| ap-east-2 | 0.612 |  |
| ap-northeast-1 | 0.491 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.521 |  |
| ap-south-1 | 0.890 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.639 |  |
| ap-southeast-3 | 0.799 |  |
| ap-southeast-4 | 0.682 |  |
| ap-southeast-5 | 0.770 |  |
| ap-southeast-6 | 0.685 |  |
| ap-southeast-7 | 0.846 |  |
| ca-central-1 | 0.263 | 16 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.528 |  |
| eu-central-2 | 0.562 |  |
| eu-north-1 | 0.571 |  |
| eu-south-1 | 0.568 |  |
| eu-south-2 | 0.562 |  |
| eu-west-1 | 0.445 |  |
| eu-west-2 | 0.488 |  |
| eu-west-3 | 0.511 |  |
| il-central-1 | 0.677 |  |
| me-central-1 | 0.925 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.206 | 4886 |
| us-east-2 | 0.211 | 1657 |
| us-gov-east-1 | 0.202 | 1770 |
| us-gov-west-1 | 0.158 | 205 |
| us-west-1 | 0.113 | 3806 |
| us-west-2 | 0.157 | 167 |

