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
Updated: 2026-04-04T19:26:10.803927+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.953 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.685 |  |
| ap-northeast-1 | 0.566 |  |
| ap-northeast-2 | 0.671 |  |
| ap-northeast-3 | 0.595 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.951 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.726 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.770 |  |
| ap-southeast-5 | 0.836 |  |
| ap-southeast-6 | 0.782 |  |
| ap-southeast-7 | 0.924 |  |
| ca-central-1 | 0.117 | 16 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.465 |  |
| eu-central-2 | 0.478 |  |
| eu-north-1 | 0.520 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.506 |  |
| eu-west-1 | 0.399 |  |
| eu-west-2 | 0.426 |  |
| eu-west-3 | 0.451 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.833 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.577 |  |
| us-east-1 | 0.099 | 4434 |
| us-east-2 | 0.072 | 1481 |
| us-gov-east-1 | 0.074 | 1627 |
| us-gov-west-1 | 0.241 | 191 |
| us-west-1 | 0.197 | 3353 |
| us-west-2 | 0.243 | 153 |

