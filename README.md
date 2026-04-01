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
Updated: 2026-04-01T01:52:58.462580+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.026 |  |
| ap-east-1 | 0.670 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.491 |  |
| ap-northeast-2 | 0.605 |  |
| ap-northeast-3 | 0.513 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.859 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.680 |  |
| ap-southeast-3 | 0.808 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.764 |  |
| ap-southeast-6 | 0.796 |  |
| ap-southeast-7 | 0.846 |  |
| ca-central-1 | 0.242 | 16 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.536 |  |
| eu-central-2 | 0.564 |  |
| eu-north-1 | 0.590 |  |
| eu-south-1 | 0.550 |  |
| eu-south-2 | 0.572 |  |
| eu-west-1 | 0.458 |  |
| eu-west-2 | 0.501 |  |
| eu-west-3 | 0.509 |  |
| il-central-1 | 0.709 |  |
| me-central-1 | 0.909 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.284 |  |
| sa-east-1 | 0.639 |  |
| us-east-1 | 0.197 | 4411 |
| us-east-2 | 0.183 | 1469 |
| us-gov-east-1 | 0.189 | 1618 |
| us-gov-west-1 | 0.174 | 190 |
| us-west-1 | 0.165 | 3328 |
| us-west-2 | 0.173 | 153 |

