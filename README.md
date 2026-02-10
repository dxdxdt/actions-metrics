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
Updated: 2026-02-10T09:53:56.882175+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.022 |  |
| ap-east-1 | 0.689 |  |
| ap-northeast-1 | 0.510 |  |
| ap-northeast-2 | 0.622 |  |
| ap-south-1 | 0.884 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.642 |  |
| ap-southeast-3 | 0.827 |  |
| ap-southeast-4 | 0.680 |  |
| ca-central-1 | 0.237 | 16 |
| ca-west-1 | 0.200 |  |
| eu-central-1 | 0.529 |  |
| eu-central-2 | 0.551 |  |
| eu-north-1 | 0.586 |  |
| eu-south-1 | 0.561 |  |
| eu-south-2 | 0.566 |  |
| eu-west-1 | 0.458 |  |
| eu-west-2 | 0.489 |  |
| eu-west-3 | 0.530 |  |
| il-central-1 | 0.716 |  |
| me-central-1 | 0.929 |  |
| me-south-1 | 0.903 |  |
| sa-east-1 | 0.633 |  |
| us-east-1 | 0.200 | 4095 |
| us-east-2 | 0.187 | 1328 |
| us-gov-east-1 | 0.185 | 1449 |
| us-gov-west-1 | 0.167 | 142 |
| us-west-1 | 0.123 | 3033 |
| us-west-2 | 0.170 | 125 |

