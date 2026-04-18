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
Updated: 2026-04-18T20:28:21.267058+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.001 |  |
| ap-east-1 | 0.706 |  |
| ap-east-2 | 0.629 |  |
| ap-northeast-1 | 0.520 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.882 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.659 |  |
| ap-southeast-3 | 0.827 |  |
| ap-southeast-4 | 0.707 |  |
| ap-southeast-5 | 0.789 |  |
| ap-southeast-6 | 0.693 |  |
| ap-southeast-7 | 0.870 |  |
| ca-central-1 | 0.222 | 16 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.523 |  |
| eu-central-2 | 0.531 |  |
| eu-north-1 | 0.573 |  |
| eu-south-1 | 0.546 |  |
| eu-south-2 | 0.559 |  |
| eu-west-1 | 0.432 |  |
| eu-west-2 | 0.480 |  |
| eu-west-3 | 0.502 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.887 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.177 | 4523 |
| us-east-2 | 0.161 | 1511 |
| us-gov-east-1 | 0.170 | 1656 |
| us-gov-west-1 | 0.179 | 194 |
| us-west-1 | 0.134 | 3436 |
| us-west-2 | 0.181 | 156 |

