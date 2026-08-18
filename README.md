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
Updated: 2026-08-18T07:31:13.237866+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.948 |  |
| ap-east-1 | 0.732 |  |
| ap-east-2 | 0.670 |  |
| ap-northeast-1 | 0.551 |  |
| ap-northeast-2 | 0.657 |  |
| ap-northeast-3 | 0.576 |  |
| ap-south-1 | 0.876 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.709 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.756 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.740 |  |
| ap-southeast-7 | 0.909 |  |
| ca-central-1 | 0.166 | 18 |
| ca-west-1 | 0.223 |  |
| eu-central-1 | 0.467 |  |
| eu-central-2 | 0.496 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.506 |  |
| eu-south-2 | 0.509 |  |
| eu-west-1 | 0.400 |  |
| eu-west-2 | 0.446 |  |
| eu-west-3 | 0.446 |  |
| il-central-1 | 0.629 |  |
| me-central-1 | 0.868 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.574 |  |
| us-east-1 | 0.123 | 5015 |
| us-east-2 | 0.139 | 1680 |
| us-gov-east-1 | 0.128 | 1843 |
| us-gov-west-1 | 0.234 | 224 |
| us-west-1 | 0.173 | 3985 |
| us-west-2 | 0.232 | 181 |

