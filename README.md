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
Updated: 2026-02-27T04:06:34.937330+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.034 |  |
| ap-east-1 | 0.676 |  |
| ap-east-2 | 0.617 |  |
| ap-northeast-1 | 0.499 |  |
| ap-northeast-2 | 0.619 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.872 |  |
| ap-southeast-1 | 0.754 |  |
| ap-southeast-2 | 0.648 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.688 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.720 |  |
| ap-southeast-7 | 0.847 |  |
| ca-central-1 | 0.264 | 16 |
| ca-west-1 | 0.205 |  |
| eu-central-1 | 0.529 |  |
| eu-central-2 | 0.558 |  |
| eu-north-1 | 0.573 |  |
| eu-south-1 | 0.567 |  |
| eu-south-2 | 0.560 |  |
| eu-west-1 | 0.454 |  |
| eu-west-2 | 0.486 |  |
| eu-west-3 | 0.511 |  |
| il-central-1 | 0.706 |  |
| me-central-1 | 0.920 |  |
| me-south-1 | 0.878 |  |
| mx-central-1 | 0.266 |  |
| sa-east-1 | 0.641 |  |
| us-east-1 | 0.197 | 4192 |
| us-east-2 | 0.190 | 1381 |
| us-gov-east-1 | 0.191 | 1513 |
| us-gov-west-1 | 0.179 | 162 |
| us-west-1 | 0.120 | 3128 |
| us-west-2 | 0.181 | 132 |

