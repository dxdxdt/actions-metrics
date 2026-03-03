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
Updated: 2026-03-03T18:38:08.606816+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.048 |  |
| ap-east-1 | 0.670 |  |
| ap-east-2 | 0.607 |  |
| ap-northeast-1 | 0.488 |  |
| ap-northeast-2 | 0.596 |  |
| ap-northeast-3 | 0.513 |  |
| ap-south-1 | 0.915 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.741 |  |
| ap-southeast-2 | 0.632 |  |
| ap-southeast-3 | 0.794 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.761 |  |
| ap-southeast-6 | 0.680 |  |
| ap-southeast-7 | 0.844 |  |
| ca-central-1 | 0.239 | 16 |
| ca-west-1 | 0.194 |  |
| eu-central-1 | 0.551 |  |
| eu-central-2 | 0.564 |  |
| eu-north-1 | 0.619 |  |
| eu-south-1 | 0.578 |  |
| eu-south-2 | 0.586 |  |
| eu-west-1 | 0.481 |  |
| eu-west-2 | 0.522 |  |
| eu-west-3 | 0.532 |  |
| il-central-1 | 0.736 |  |
| me-central-1 | 0.919 |  |
| me-south-1 | 0.891 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.655 |  |
| us-east-1 | 0.215 | 4212 |
| us-east-2 | 0.172 | 1396 |
| us-gov-east-1 | 0.182 | 1527 |
| us-gov-west-1 | 0.144 | 169 |
| us-west-1 | 0.121 | 3166 |
| us-west-2 | 0.143 | 137 |

