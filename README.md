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
Updated: 2026-01-16T04:34:01.716787+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.032 |  |
| ap-east-1 | 0.683 |  |
| ap-northeast-1 | 0.489 |  |
| ap-northeast-2 | 0.590 |  |
| ap-south-1 | 0.949 |  |
| ap-southeast-1 | 0.788 |  |
| ap-southeast-2 | 0.628 |  |
| ca-central-1 | 0.261 | 16 |
| eu-central-1 | 0.566 |  |
| eu-north-1 | 0.602 |  |
| eu-south-1 | 0.572 |  |
| eu-west-1 | 0.464 |  |
| eu-west-2 | 0.510 |  |
| eu-west-3 | 0.522 |  |
| me-south-1 | 0.887 |  |
| sa-east-1 | 0.672 |  |
| us-east-1 | 0.225 | 3938 |
| us-east-2 | 0.183 | 1251 |
| us-gov-east-1 | 0.183 | 1367 |
| us-gov-west-1 | 0.139 | 116 |
| us-west-1 | 0.119 | 2861 |
| us-west-2 | 0.160 | 107 |

