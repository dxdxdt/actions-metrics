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
Updated: 2026-02-23T12:44:41.225457+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.052 |  |
| ap-east-1 | 0.638 |  |
| ap-east-2 | 0.578 |  |
| ap-northeast-1 | 0.458 |  |
| ap-northeast-2 | 0.565 |  |
| ap-northeast-3 | 0.483 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.711 |  |
| ap-southeast-2 | 0.597 |  |
| ap-southeast-3 | 0.768 |  |
| ap-southeast-4 | 0.639 |  |
| ap-southeast-5 | 0.730 |  |
| ap-southeast-6 | 0.646 |  |
| ap-southeast-7 | 0.814 |  |
| ca-central-1 | 0.304 | 16 |
| ca-west-1 | 0.180 |  |
| eu-central-1 | 0.577 |  |
| eu-central-2 | 0.610 |  |
| eu-north-1 | 0.617 |  |
| eu-south-1 | 0.621 |  |
| eu-south-2 | 0.621 |  |
| eu-west-1 | 0.497 |  |
| eu-west-2 | 0.529 |  |
| eu-west-3 | 0.566 |  |
| il-central-1 | 0.758 |  |
| me-central-1 | 0.974 |  |
| me-south-1 | 0.929 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.704 |  |
| us-east-1 | 0.238 | 4170 |
| us-east-2 | 0.218 | 1371 |
| us-gov-east-1 | 0.224 | 1502 |
| us-gov-west-1 | 0.126 | 160 |
| us-west-1 | 0.073 | 3104 |
| us-west-2 | 0.129 | 130 |

