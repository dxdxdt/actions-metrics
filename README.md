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
Updated: 2026-05-23T03:22:22.730318+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.975 |  |
| ap-east-1 | 0.725 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.550 |  |
| ap-northeast-2 | 0.654 |  |
| ap-northeast-3 | 0.575 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.943 |  |
| ap-southeast-1 | 0.800 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.819 |  |
| ap-southeast-6 | 0.751 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.137 | 16 |
| ca-west-1 | 0.197 |  |
| eu-central-1 | 0.489 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.521 |  |
| eu-south-1 | 0.500 |  |
| eu-south-2 | 0.518 |  |
| eu-west-1 | 0.406 |  |
| eu-west-2 | 0.444 |  |
| eu-west-3 | 0.462 |  |
| il-central-1 | 0.633 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.204 |  |
| sa-east-1 | 0.573 |  |
| us-east-1 | 0.123 | 4676 |
| us-east-2 | 0.099 | 1607 |
| us-gov-east-1 | 0.098 | 1702 |
| us-gov-west-1 | 0.229 | 195 |
| us-west-1 | 0.182 | 3587 |
| us-west-2 | 0.221 | 159 |

