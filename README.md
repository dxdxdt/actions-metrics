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
Updated: 2026-04-04T23:24:18.139620+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.970 |  |
| ap-east-1 | 0.734 |  |
| ap-east-2 | 0.676 |  |
| ap-northeast-1 | 0.556 |  |
| ap-northeast-2 | 0.657 |  |
| ap-northeast-3 | 0.577 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.805 |  |
| ap-southeast-2 | 0.711 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.823 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.909 |  |
| ca-central-1 | 0.138 | 16 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.486 |  |
| eu-central-2 | 0.493 |  |
| eu-north-1 | 0.528 |  |
| eu-south-1 | 0.504 |  |
| eu-south-2 | 0.516 |  |
| eu-west-1 | 0.404 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.460 |  |
| il-central-1 | 0.666 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.122 | 4434 |
| us-east-2 | 0.096 | 1482 |
| us-gov-east-1 | 0.096 | 1628 |
| us-gov-west-1 | 0.222 | 191 |
| us-west-1 | 0.168 | 3355 |
| us-west-2 | 0.231 | 153 |

