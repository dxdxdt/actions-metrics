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
Updated: 2026-03-07T04:56:59.239680+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.740 |  |
| ap-east-2 | 0.684 |  |
| ap-northeast-1 | 0.564 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.590 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.974 |  |
| ap-southeast-1 | 0.819 |  |
| ap-southeast-2 | 0.728 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.837 |  |
| ap-southeast-6 | 0.770 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.126 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.457 |  |
| eu-central-2 | 0.469 |  |
| eu-north-1 | 0.509 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.374 |  |
| eu-west-2 | 0.417 |  |
| eu-west-3 | 0.442 |  |
| il-central-1 | 0.627 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.798 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.559 |  |
| us-east-1 | 0.106 | 4233 |
| us-east-2 | 0.093 | 1406 |
| us-gov-east-1 | 0.097 | 1534 |
| us-gov-west-1 | 0.225 | 174 |
| us-west-1 | 0.222 | 3187 |
| us-west-2 | 0.223 | 142 |

