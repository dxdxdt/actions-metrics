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
Updated: 2026-03-29T01:45:59.372766+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.739 |  |
| ap-east-2 | 0.670 |  |
| ap-northeast-1 | 0.555 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.930 |  |
| ap-southeast-1 | 0.807 |  |
| ap-southeast-2 | 0.722 |  |
| ap-southeast-3 | 0.869 |  |
| ap-southeast-4 | 0.758 |  |
| ap-southeast-5 | 0.829 |  |
| ap-southeast-6 | 0.789 |  |
| ap-southeast-7 | 0.920 |  |
| ca-central-1 | 0.174 | 16 |
| ca-west-1 | 0.293 |  |
| eu-central-1 | 0.456 |  |
| eu-central-2 | 0.478 |  |
| eu-north-1 | 0.506 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.513 |  |
| eu-west-1 | 0.378 |  |
| eu-west-2 | 0.416 |  |
| eu-west-3 | 0.438 |  |
| il-central-1 | 0.633 |  |
| me-central-1 | 0.831 |  |
| me-south-1 | 0.787 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.575 |  |
| us-east-1 | 0.135 | 4385 |
| us-east-2 | 0.159 | 1461 |
| us-gov-east-1 | 0.129 | 1611 |
| us-gov-west-1 | 0.240 | 190 |
| us-west-1 | 0.183 | 3317 |
| us-west-2 | 0.239 | 152 |

