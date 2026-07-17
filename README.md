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
Updated: 2026-07-17T18:56:10.504487+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.891 |  |
| ap-east-1 | 0.775 |  |
| ap-east-2 | 0.715 |  |
| ap-northeast-1 | 0.600 |  |
| ap-northeast-2 | 0.700 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.869 |  |
| ap-southeast-1 | 0.852 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.816 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.809 |  |
| ap-southeast-7 | 0.949 |  |
| ca-central-1 | 0.140 | 16 |
| ca-west-1 | 0.232 |  |
| eu-central-1 | 0.417 |  |
| eu-central-2 | 0.439 |  |
| eu-north-1 | 0.462 |  |
| eu-south-1 | 0.439 |  |
| eu-south-2 | 0.451 |  |
| eu-west-1 | 0.330 |  |
| eu-west-2 | 0.384 |  |
| eu-west-3 | 0.396 |  |
| il-central-1 | 0.567 |  |
| me-central-1 | 0.818 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.519 |  |
| us-east-1 | 0.082 | 4877 |
| us-east-2 | 0.108 | 1656 |
| us-gov-east-1 | 0.111 | 1763 |
| us-gov-west-1 | 0.283 | 203 |
| us-west-1 | 0.247 | 3792 |
| us-west-2 | 0.291 | 166 |

