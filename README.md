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
Updated: 2026-02-15T21:18:14.075708+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.719 |  |
| ap-east-2 | 0.644 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.630 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.786 |  |
| ap-southeast-2 | 0.686 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.810 |  |
| ap-southeast-6 | 0.732 |  |
| ap-southeast-7 | 0.893 |  |
| ca-central-1 | 0.198 | 16 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.501 |  |
| eu-central-2 | 0.508 |  |
| eu-north-1 | 0.547 |  |
| eu-south-1 | 0.540 |  |
| eu-south-2 | 0.536 |  |
| eu-west-1 | 0.407 |  |
| eu-west-2 | 0.462 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.659 |  |
| me-central-1 | 0.869 |  |
| me-south-1 | 0.842 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.592 |  |
| us-east-1 | 0.148 | 4126 |
| us-east-2 | 0.151 | 1346 |
| us-gov-east-1 | 0.155 | 1475 |
| us-gov-west-1 | 0.209 | 148 |
| us-west-1 | 0.171 | 3063 |
| us-west-2 | 0.211 | 125 |

