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
Updated: 2026-02-13T06:50:50.242384+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.012 |  |
| ap-east-1 | 0.700 |  |
| ap-northeast-1 | 0.522 |  |
| ap-northeast-2 | 0.633 |  |
| ap-south-1 | 0.930 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.675 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.718 |  |
| ca-central-1 | 0.190 | 16 |
| ca-west-1 | 0.184 |  |
| eu-central-1 | 0.520 |  |
| eu-central-2 | 0.526 |  |
| eu-north-1 | 0.565 |  |
| eu-south-1 | 0.544 |  |
| eu-south-2 | 0.559 |  |
| eu-west-1 | 0.434 |  |
| eu-west-2 | 0.472 |  |
| eu-west-3 | 0.503 |  |
| il-central-1 | 0.689 |  |
| me-central-1 | 0.907 |  |
| me-south-1 | 0.875 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.158 | 4113 |
| us-east-2 | 0.131 | 1336 |
| us-gov-east-1 | 0.134 | 1456 |
| us-gov-west-1 | 0.176 | 145 |
| us-west-1 | 0.167 | 3051 |
| us-west-2 | 0.177 | 125 |

