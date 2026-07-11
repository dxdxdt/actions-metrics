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
Updated: 2026-07-11T14:23:42.507331+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.891 |  |
| ap-east-1 | 0.799 |  |
| ap-east-2 | 0.742 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.724 |  |
| ap-northeast-3 | 0.649 |  |
| ap-south-1 | 0.839 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.875 |  |
| ap-southeast-2 | 0.774 |  |
| ap-southeast-3 | 0.924 |  |
| ap-southeast-4 | 0.828 |  |
| ap-southeast-5 | 0.895 |  |
| ap-southeast-6 | 0.817 |  |
| ap-southeast-7 | 0.978 |  |
| ca-central-1 | 0.108 | 16 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.398 |  |
| eu-central-2 | 0.416 |  |
| eu-north-1 | 0.454 |  |
| eu-south-1 | 0.428 |  |
| eu-south-2 | 0.435 |  |
| eu-west-1 | 0.319 |  |
| eu-west-2 | 0.356 |  |
| eu-west-3 | 0.381 |  |
| il-central-1 | 0.559 |  |
| me-central-1 | 0.798 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.242 |  |
| sa-east-1 | 0.507 |  |
| us-east-1 | 0.060 | 4849 |
| us-east-2 | 0.081 | 1656 |
| us-gov-east-1 | 0.082 | 1737 |
| us-gov-west-1 | 0.301 | 202 |
| us-west-1 | 0.250 | 3765 |
| us-west-2 | 0.302 | 165 |

