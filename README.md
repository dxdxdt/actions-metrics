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
Updated: 2026-07-10T10:17:01.153828+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.950 |  |
| ap-east-1 | 0.741 |  |
| ap-east-2 | 0.676 |  |
| ap-northeast-1 | 0.560 |  |
| ap-northeast-2 | 0.680 |  |
| ap-northeast-3 | 0.586 |  |
| ap-south-1 | 0.853 |  |
| ap-south-2 | 0.863 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.779 |  |
| ap-southeast-5 | 0.843 |  |
| ap-southeast-6 | 0.768 |  |
| ap-southeast-7 | 0.933 |  |
| ca-central-1 | 0.188 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.461 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.490 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.380 |  |
| eu-west-2 | 0.433 |  |
| eu-west-3 | 0.444 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.869 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.128 | 4843 |
| us-east-2 | 0.149 | 1656 |
| us-gov-east-1 | 0.152 | 1733 |
| us-gov-west-1 | 0.251 | 202 |
| us-west-1 | 0.213 | 3761 |
| us-west-2 | 0.256 | 164 |

