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
Updated: 2026-07-08T10:56:18.022420+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.949 |  |
| ap-east-1 | 0.740 |  |
| ap-east-2 | 0.684 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.588 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.816 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.875 |  |
| ap-southeast-4 | 0.779 |  |
| ap-southeast-5 | 0.839 |  |
| ap-southeast-6 | 0.768 |  |
| ap-southeast-7 | 0.923 |  |
| ca-central-1 | 0.153 | 16 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.492 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.502 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.397 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.473 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.834 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.581 |  |
| us-east-1 | 0.116 | 4834 |
| us-east-2 | 0.147 | 1656 |
| us-gov-east-1 | 0.161 | 1730 |
| us-gov-west-1 | 0.247 | 201 |
| us-west-1 | 0.206 | 3756 |
| us-west-2 | 0.245 | 164 |

