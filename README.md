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
Updated: 2026-07-12T18:54:18.032474+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.856 |  |
| ap-east-1 | 0.827 |  |
| ap-east-2 | 0.764 |  |
| ap-northeast-1 | 0.649 |  |
| ap-northeast-2 | 0.752 |  |
| ap-northeast-3 | 0.677 |  |
| ap-south-1 | 0.825 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.900 |  |
| ap-southeast-2 | 0.784 |  |
| ap-southeast-3 | 0.948 |  |
| ap-southeast-4 | 0.837 |  |
| ap-southeast-5 | 0.921 |  |
| ap-southeast-6 | 0.830 |  |
| ap-southeast-7 | 1.002 |  |
| ca-central-1 | 0.105 | 16 |
| ca-west-1 | 0.284 |  |
| eu-central-1 | 0.372 |  |
| eu-central-2 | 0.393 |  |
| eu-north-1 | 0.415 |  |
| eu-south-1 | 0.409 |  |
| eu-south-2 | 0.410 |  |
| eu-west-1 | 0.291 |  |
| eu-west-2 | 0.331 |  |
| eu-west-3 | 0.357 |  |
| il-central-1 | 0.529 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.479 |  |
| us-east-1 | 0.043 | 4859 |
| us-east-2 | 0.072 | 1656 |
| us-gov-east-1 | 0.093 | 1740 |
| us-gov-west-1 | 0.314 | 202 |
| us-west-1 | 0.260 | 3772 |
| us-west-2 | 0.315 | 165 |

