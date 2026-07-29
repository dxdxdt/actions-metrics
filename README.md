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
Updated: 2026-07-29T21:53:09.903900+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.675 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.497 |  |
| ap-northeast-2 | 0.601 |  |
| ap-northeast-3 | 0.524 |  |
| ap-south-1 | 0.878 |  |
| ap-south-2 | 0.900 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.680 |  |
| ap-southeast-3 | 0.802 |  |
| ap-southeast-4 | 0.723 |  |
| ap-southeast-5 | 0.769 |  |
| ap-southeast-6 | 0.701 |  |
| ap-southeast-7 | 0.854 |  |
| ca-central-1 | 0.225 | 17 |
| ca-west-1 | 0.168 |  |
| eu-central-1 | 0.526 |  |
| eu-central-2 | 0.548 |  |
| eu-north-1 | 0.556 |  |
| eu-south-1 | 0.541 |  |
| eu-south-2 | 0.560 |  |
| eu-west-1 | 0.446 |  |
| eu-west-2 | 0.485 |  |
| eu-west-3 | 0.510 |  |
| il-central-1 | 0.681 |  |
| me-central-1 | 0.906 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.639 |  |
| us-east-1 | 0.190 | 4920 |
| us-east-2 | 0.152 | 1670 |
| us-gov-east-1 | 0.155 | 1786 |
| us-gov-west-1 | 0.166 | 208 |
| us-west-1 | 0.161 | 3853 |
| us-west-2 | 0.164 | 171 |

