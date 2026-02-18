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
Updated: 2026-02-18T04:14:33.345373+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.997 |  |
| ap-east-1 | 0.710 |  |
| ap-east-2 | 0.646 |  |
| ap-northeast-1 | 0.525 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.556 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.686 |  |
| ap-southeast-3 | 0.836 |  |
| ap-southeast-4 | 0.720 |  |
| ap-southeast-5 | 0.809 |  |
| ap-southeast-6 | 0.722 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.188 | 16 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.503 |  |
| eu-central-2 | 0.515 |  |
| eu-north-1 | 0.558 |  |
| eu-south-1 | 0.532 |  |
| eu-south-2 | 0.534 |  |
| eu-west-1 | 0.420 |  |
| eu-west-2 | 0.451 |  |
| eu-west-3 | 0.490 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.878 |  |
| me-south-1 | 0.837 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.151 | 4137 |
| us-east-2 | 0.135 | 1353 |
| us-gov-east-1 | 0.136 | 1487 |
| us-gov-west-1 | 0.185 | 153 |
| us-west-1 | 0.168 | 3071 |
| us-west-2 | 0.188 | 126 |

