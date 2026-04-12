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
Updated: 2026-04-12T21:27:19.019276+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.994 |  |
| ap-east-1 | 0.696 |  |
| ap-east-2 | 0.634 |  |
| ap-northeast-1 | 0.515 |  |
| ap-northeast-2 | 0.618 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.773 |  |
| ap-southeast-2 | 0.681 |  |
| ap-southeast-3 | 0.832 |  |
| ap-southeast-4 | 0.717 |  |
| ap-southeast-5 | 0.793 |  |
| ap-southeast-6 | 0.751 |  |
| ap-southeast-7 | 0.879 |  |
| ca-central-1 | 0.210 | 16 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.488 |  |
| eu-central-2 | 0.509 |  |
| eu-north-1 | 0.548 |  |
| eu-south-1 | 0.514 |  |
| eu-south-2 | 0.530 |  |
| eu-west-1 | 0.414 |  |
| eu-west-2 | 0.464 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.680 |  |
| me-central-1 | 0.870 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.605 |  |
| us-east-1 | 0.154 | 4489 |
| us-east-2 | 0.167 | 1497 |
| us-gov-east-1 | 0.159 | 1646 |
| us-gov-west-1 | 0.203 | 192 |
| us-west-1 | 0.145 | 3403 |
| us-west-2 | 0.204 | 155 |

