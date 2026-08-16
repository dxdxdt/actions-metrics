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
Updated: 2026-08-16T09:19:43.051167+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.901 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.724 |  |
| ap-northeast-1 | 0.608 |  |
| ap-northeast-2 | 0.710 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.866 |  |
| ap-southeast-2 | 0.756 |  |
| ap-southeast-3 | 0.918 |  |
| ap-southeast-4 | 0.817 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.820 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.141 | 18 |
| ca-west-1 | 0.275 |  |
| eu-central-1 | 0.415 |  |
| eu-central-2 | 0.444 |  |
| eu-north-1 | 0.459 |  |
| eu-south-1 | 0.442 |  |
| eu-south-2 | 0.453 |  |
| eu-west-1 | 0.332 |  |
| eu-west-2 | 0.370 |  |
| eu-west-3 | 0.396 |  |
| il-central-1 | 0.568 |  |
| me-central-1 | 0.830 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.514 |  |
| us-east-1 | 0.079 | 5007 |
| us-east-2 | 0.110 | 1679 |
| us-gov-east-1 | 0.118 | 1832 |
| us-gov-west-1 | 0.287 | 223 |
| us-west-1 | 0.230 | 3964 |
| us-west-2 | 0.280 | 179 |

